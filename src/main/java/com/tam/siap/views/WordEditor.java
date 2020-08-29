package com.tam.siap.views;

import com.tam.siap.utils.ConvertDocx;
import com.tam.siap.utils.ConvertHTML;

import java.io.IOException;

public class WordEditor {

    public static boolean convDocx () {
        ConvertDocx convertDocx = new ConvertDocx();
        convertDocx.createHTML();
        return true;
    }

    public static boolean convHTML () throws IOException {
        ConvertHTML convertHTML = new ConvertHTML();
        convertHTML.createDocx();
        return true;
    }

}
