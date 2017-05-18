package com.zh.process;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;


//产生随机的数
public class RandomNumberGenerator {
	
	private static final int LENGTH = 3;

	public String generateNumber() {
		String no = "";
		int[] defaultNums = new int[10];
		for (int i = 0; i < defaultNums.length; i++) {
			defaultNums[i] = i;
		}
		Random random = new Random();
		int[] nums = new int[LENGTH];
		int canBeUsed = 10;
		for (int i = 0; i < nums.length; i++) {
			int index = random.nextInt(canBeUsed);
			nums[i] = defaultNums[index];
			swap(index, canBeUsed - 1, defaultNums);
			canBeUsed--;
		}
		if (nums.length > 0) {
			for(int i = 0; i < nums.length; i++) {
				no += nums[i];
			}
		}

		Date date= new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("ddHHmmss");
		String str = sdf.format(date);
		return no+str;
	}

	private static void swap(int i, int j, int[] nums) {
		int temp = nums[i];
		nums[i] = nums[j];
		nums[j] = temp;
	}
}
