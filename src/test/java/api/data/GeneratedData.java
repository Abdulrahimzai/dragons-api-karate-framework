package api.data;

import java.util.Random;

public class GeneratedData {
 public static String getEmail() {
	 String email = "autogenn0erated";
	 String provider = "@tekschool.us";
	 int randomNum = (int) (Math.random()* 100);
	 String autoEmail = email + randomNum + provider;
	 return autoEmail;
 }
 
 public static String getPhoneNumber() {
	 String phoneNumber ="9";
	 for(int i =0;i<9;i++) {
		 phoneNumber +=(int) (Math.random()*10);
	 }
	 return phoneNumber;
 }
 public static String GetLicensePlate() {
	 Random random = new Random();
	 StringBuilder sb = new StringBuilder();
	 String letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
	 int count =4;
	 for(int i =0; i <count;i++) {
		 int randomIndex = random.nextInt(letters.length());
		 char randomChar = letters.charAt(randomIndex);
		 sb.append(randomChar);
	 }
	 for(int i=0;i<4;i++) {
		 int randomDigit = (int)(Math.random() * 10);
		 sb.append(randomDigit);
	 }
	 return sb.toString();
 }

	public static void main(String[] args) {
		System.out.println(getPhoneNumber());
}

}
