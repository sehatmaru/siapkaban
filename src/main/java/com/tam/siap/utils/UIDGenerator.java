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
    
}
