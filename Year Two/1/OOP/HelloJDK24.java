public class HelloJDK24 {
    public static void main(String[] args) {
        System.out.println("✅ JDK 24 is working!");
        System.out.println("Java Version: " + System.getProperty("java.version"));
        System.out.println("Java Home: " + System.getProperty("java.home"));
        
        // Test some modern Java features (if you want to try)
        String message = """
            This is a text block!
            JDK 24 is running successfully.
            Enjoy Java development! 🎉
            """;
        System.out.println(message);
    }
}