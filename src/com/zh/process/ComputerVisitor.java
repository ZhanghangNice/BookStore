package com.zh.process;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

//计算访客人数 
public class ComputerVisitor {
	private int number =0;
	private boolean isCome = false;
	
	File file = new File("count.dat");
	private void countPeople(){
		if(!file.exists()){
			number++;
			try {
				file.createNewFile();
				FileOutputStream out = new FileOutputStream(file);
				DataOutputStream dataOut = new DataOutputStream(out);
				dataOut.writeInt(number);
				out.close();
				dataOut.close();
			} catch (IOException e) {
				// TODO: handle exception
			}
		}
		else {
			try {
				FileInputStream in = new FileInputStream(file);
				DataInputStream dataIn = new DataInputStream(in);
				number = dataIn.readInt();
				number++;
				in.close();
				dataIn.close();
				FileOutputStream out = new FileOutputStream(file);
				DataOutputStream dataOut = new DataOutputStream(out);
				dataOut.writeInt(number);
				out.close();
				dataOut.close();
			} catch (IOException e) {
				// TODO: handle exception
			}
		}
		isCome =true;
	}
	public int getNumber() {
		if(isCome == false)
			countPeople();
		return number;
	}

}
