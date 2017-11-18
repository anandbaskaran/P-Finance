package com.PersonalFinance.Parse;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.poi.poifs.filesystem.POIFSFileSystem;

public class MutualFundParser {
	public void parseFile(String fileName) throws FileNotFoundException, IOException{
		
			File file = new File(fileName);
			POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(file));
			
		
	}
}
