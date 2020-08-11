package com.tam.siap.utils;

import java.util.concurrent.atomic.AtomicLong;

public class UIDGenerator {
	
	public static UIDGenerator instance;
	
	private UIDGenerator(){
		
	}
	
	public static UIDGenerator getInstance(){
		if(instance == null){
			instance = new UIDGenerator();
		}
		return instance;
	}

	private static final AtomicLong TS = new AtomicLong();


	public long getUID() {
        long micros = System.currentTimeMillis() * 1000;
        for (;;) {
            long value = TS.get();
            if (micros <= value)
                micros = value + 1;
            if (TS.compareAndSet(value, micros))
                return micros;
        }
    }
	
	public long getCustomUID(int digit) {
        return getLastDigit(""+getUID(), digit);
    }
	
	private long getLastDigit(String num, int digit) {
		if (num.length() == digit) {
			  return Long.parseLong(num);
			} else if (num.length() > digit) {
			  return Long.parseLong(num.substring(num.length() - digit));
			} else {
			  // whatever is appropriate in this case
			  throw new IllegalArgumentException("word has less than 3 characters!");
			}
	}
    
}
