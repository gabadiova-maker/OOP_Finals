
package bookbridge.dao;

public class ReservationTest {

    public static void main(String[] args) {

        BookBridgeDAO dao = new BookBridgeDAO();

        System.out.println("=== BookBridge Reservation Test ===");

        try {
            int first = dao.reserveBook("M001", "B001");
            System.out.println("Reservation created: " + first);

            boolean cancelled = dao.cancelReservation(first);
            System.out.println("Reservation cancelled: " + cancelled);

            int second = dao.reserveBook("M001", "B001");
            System.out.println("Second reservation created: " + second);

            Integer processed = dao.processNextReservation();
            System.out.println("Processed reservation: " + processed);

            System.out.println("\n=== Reservations ===");

            for (String[] row : dao.getAllReservations()) {
                System.out.println(String.join(" | ", row));
            }

        } catch (java.sql.SQLException | RuntimeException e) {
            System.out.println("Test failed: " + e.getMessage());
        }
    }
}
