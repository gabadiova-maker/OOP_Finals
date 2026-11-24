
package bookbridge.dao;

public class BorrowReturnTest {

    public static void main(String[] args) {

        BookBridgeDAO dao = new BookBridgeDAO();

        System.out.println("=== BookBridge Borrow and Return Test ===");

        try {
            int loanId = dao.borrowBook("M001", "B001", 7);

            System.out.println("Loan created: " + loanId);
            System.out.println("Available copies after borrow: "
                    + dao.findBook("B001")[3]);

            double fine = dao.returnBook(loanId);

            System.out.println("Loan returned.");
            System.out.println("Late fine: PHP " + fine);
            System.out.println("Available copies after return: "
                    + dao.findBook("B001")[3]);

        } catch (java.sql.SQLException | RuntimeException e) {
            System.out.println("Test failed: " + e.getMessage());
        }
    }
}
