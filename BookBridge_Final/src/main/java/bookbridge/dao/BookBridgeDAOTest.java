
package bookbridge.dao;

public class BookBridgeDAOTest {

    public static void main(String[] args) {

        BookBridgeDAO dao = new BookBridgeDAO();

        System.out.println("=== BookBridge DAO Test ===");

        try {
            if (dao.findMember("M001") == null) {
                dao.addMember("M001", "Ana Cruz", "STUDENT");
            }

            if (dao.findBook("B001") == null) {
                dao.addBook("B001", "Java Programming", 3);
            }

            System.out.println("\n=== Members ===");

            for (String[] member : dao.getAllMembers()) {
                System.out.println(String.join(" | ", member));
            }

            System.out.println("\n=== Books ===");

            for (String[] book : dao.getAllBooks()) {
                System.out.println(String.join(" | ", book));
            }

            System.out.println("\nDAO test completed successfully.");

        } catch (java.sql.SQLException | IllegalArgumentException e) {
            System.out.println("Test failed: " + e.getMessage());
        }
    }
}
