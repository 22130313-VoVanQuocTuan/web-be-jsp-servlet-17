package hcmuaf.nlu.edu.vn.controller.user.account;

public class LoginAttempt {
    private int attempts;
    private long lockTime;

    public LoginAttempt() {
        this.attempts = 0;
        this.lockTime = 0;
    }

    public void incrementAttempts() {
        if (isLocked()) return;
        attempts++;
    }

    public int getAttempts() {
        return attempts;
    }

    public void lock() {
        lockTime = System.currentTimeMillis();
    }

    public boolean isLocked() {
        return (lockTime > 0) && (System.currentTimeMillis() - lockTime < LoginController.LOCK_TIME);
    }
}
