
package bookbridge.dao;

public class ReservationLoanTest {

    public static void main(String[] args) {

        BookBridgeDAO dao = new BookBridgeDAO();

        System.out.println("=== Reservation to Loan Test ===");

        try {
            int reservationId = dao.reserveBook("M001", "B001");

            System.out.println("Reservation created: " + reservationId);

            Integer processed = dao.processNextReservation();

            System.out.println("Reservation processed: " + processed);

            System.out.println("Available copies: "
                    + dao.findBook("B001")[3]);

            System.out.println("\n=== Loan Records ===");

            for (String[] loan : dao.getAllLoans()) {
                System.out.println(String.join(" | ", loan));
            }

        } catch (java.sql.SQLException | RuntimeException e) {
            System.out.println("Test failed: " + e.getMessage());
        }
    }
}
