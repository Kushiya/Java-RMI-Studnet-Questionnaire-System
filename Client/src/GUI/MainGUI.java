 package GUI;

import java.awt.Dimension;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;

import model.User;
import controller.UserController;

import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JButton;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javax.swing.JTextField;
import java.awt.Font;
import java.awt.Color;
import javax.swing.ImageIcon;



public class MainGUI extends JFrame {

	private static final long serialVersionUID = 8529779600744952258L;

	private JPanel contentPane;
	private JTextField txtName;
	private JTextField txtEmail;

	UserController userController = new UserController();

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					MainGUI frame = new MainGUI();

					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the frame.
	 */
	public MainGUI() {
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setPreferredSize(new Dimension(900, 800));
		pack();
		setLocationRelativeTo(null);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(255, 255, 255));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);

		JButton btnTakeQuiz = new JButton("Take Quiz");
		btnTakeQuiz.setBackground(new Color(60, 179, 113));
		btnTakeQuiz.setForeground(new Color(255, 255, 255));
		btnTakeQuiz.setFont(new Font("Tahoma", Font.BOLD, 12));
		btnTakeQuiz.setBounds(340, 343, 247, 41);
		btnTakeQuiz.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				User user = userController.findByName(txtName.getText());

				if (txtName.getText().equals("") || txtEmail.getText().equals("")) {
					JOptionPane.showMessageDialog(rootPane, "Fields cannot be empty.", "User",
							JOptionPane.PLAIN_MESSAGE);
				} else {
					if (user == null) {
						User newUser = new User();

						newUser.setUserName(txtName.getText());
						newUser.setEmail(txtEmail.getText());

						if (!userController.insert(newUser))
							throw new RuntimeException();
					} else if (!user.getEmail().equals(txtEmail.getText())) {
						user.setEmail(txtEmail.getText());

						if (!userController.update(user))
							throw new RuntimeException();
					}

					user = userController.findByName(txtName.getText());

					userController.setCurrentUser(user);

					dispose();
					new QuizGUI().setVisible(true);
				}
			}
		});
		contentPane.setLayout(null);

		contentPane.add(btnTakeQuiz);

		JButton btnAdminLogin = new JButton("Admin Login");
		btnAdminLogin.setBackground(new Color(255, 99, 71));
		btnAdminLogin.setForeground(new Color(255, 255, 255));
		btnAdminLogin.setFont(new Font("Tahoma", Font.BOLD, 12));
		btnAdminLogin.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				dispose();
				new Login().setVisible(true);
			}
		});
		btnAdminLogin.setBounds(10, 712, 122, 41);
		contentPane.add(btnAdminLogin);

		JLabel lblNa = new JLabel("Name");
		lblNa.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblNa.setBounds(177, 214, 72, 16);
		contentPane.add(lblNa);

		JLabel lblEmail = new JLabel("E-mail");
		lblEmail.setFont(new Font("Tahoma", Font.BOLD, 14));
		lblEmail.setBounds(177, 272, 72, 16);
		contentPane.add(lblEmail);

		txtName = new JTextField();
		txtName.setBounds(340, 204, 247, 41);
		contentPane.add(txtName);
		txtName.setColumns(10);

		txtEmail = new JTextField();
		txtEmail.setText("");
		txtEmail.setBounds(340, 262, 247, 41);
		contentPane.add(txtEmail);
		txtEmail.setColumns(10);
		
		JLabel label = new JLabel("");
		label.setIcon(new ImageIcon("C:\\Users\\Fathima Nizra\\Desktop\\2297742.png"));
		label.setBounds(538, 449, 910, 399);
		contentPane.add(label);
		
		JLabel lblDiscoverYourFuture = new JLabel("Discover Your Future!");
		lblDiscoverYourFuture.setForeground(new Color(186, 85, 211));
		lblDiscoverYourFuture.setFont(new Font("Segoe Print", Font.BOLD, 35));
		lblDiscoverYourFuture.setBounds(217, 10, 454, 63);
		contentPane.add(lblDiscoverYourFuture);
	}
}
