import java.awt.BorderLayout;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.SwingUtilities;

public class launch extends JFrame {
    JLabel emptyLabel;

    public launch() {
        super("FrameDemo");
        emptyLabel = new JLabel("Hello World");

        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        getContentPane().add(emptyLabel, BorderLayout.CENTER);
        pack();
    }

    public static void main(String args[]) {
        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                launch l = new launch();
                l.setVisible(true);
            }
        });
    }
}
