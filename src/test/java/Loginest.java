import org.springframework.security.crypto.bcrypt.BCrypt;

public class Loginest {
    public static void main(String[] args) {


                String hashedPassword = "$2a$10$490JPKKibw8EMyP47vBar.iGQYzhV1oGSYMZ.JWrikqYDb5jRwqnq";
                String inputPassword = "12345"; // Thay bằng mật khẩu cần kiểm tra

                if (BCrypt.checkpw(inputPassword, hashedPassword)) {
                    System.out.println("Mật khẩu khớp!");
                } else {
                    System.out.println("Mật khẩu không khớp.");
                }
            }
        }


