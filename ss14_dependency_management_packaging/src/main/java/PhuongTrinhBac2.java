import java.util.Scanner;

public class PhuongTrinhBac2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        System.out.print("Nhập vào hệ số a: ");
        double a = Double.parseDouble(sc.nextLine());

        System.out.print("Nhập vào hệ số b: ");
        double b = Double.parseDouble(sc.nextLine());

        System.out.print("Nhập vào hệ số c: ");
        double c = Double.parseDouble(sc.nextLine());

        double delta = b * b - 4 * a * c;

        if (delta < 0) {
            System.out.println("Phương trình vô nghiệm");
        } else if (delta == 0) {
            double x = -b / (2 * a);
            System.out.println("Phương trình có nghiệm kép x = " + x);
        } else {
            double x1 = (-b + Math.sqrt(delta)) / (2 * a);
            double x2 = (-b - Math.sqrt(delta)) / (2 * a);
            System.out.println("Phương trình có hai nghiệm phân biệt:");
            System.out.println("x1 = " + x1);
            System.out.println("x2 = " + x2);
        }
    }
}