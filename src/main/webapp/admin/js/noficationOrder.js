document.addEventListener("DOMContentLoaded", function () {
    loadPendingOrderCount();
    // Cập nhật định kỳ mỗi 30 giây (tùy chọn)
    setInterval(loadPendingOrderCount, 30000);
});

function loadPendingOrderCount() {
    $.ajax({
        url: "pending-order-count",
        type: "GET",
        success: function (data) {
            const pendingCount = data.pendingCount;
            const badgeNav = document.getElementById("pending-order-count");
            const badge = document.getElementById("pending-order-count1");

            if (badgeNav ||badge) {
                badgeNav.textContent = pendingCount;
                badgeNav.style.display = pendingCount > 0 ? "inline-block" : "none";

                badge.textContent = pendingCount;
                badge.style.display = pendingCount > 0 ? "inline-block" : "none";
            }

        },
        error: function (xhr, status, error) {
            console.error("Lỗi khi lấy số lượng đơn hàng chưa hoàn thành:", error);
        }
    });
}