package com.PersonalFinance.local;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;

import com.PersonalFinance.util.DBOperations;

public class PFResources {
	
	public volatile static List<Person> allActivePersons = new ArrayList<Person>();
	
	public static boolean reInit(int userId){
		boolean status = false;
		boolean existingUser = false;
		Person person =  getPerson(userId);
		if(person==null){
			person =  addPerson(userId);
		}
		
		status = initPerson(person);
		return status;
	}

	private static boolean initPerson(Person person) {
		return false;
	}

	private static Person getPerson(int userId) {
		for(int i=0;i<allActivePersons.size();i++){
			if(allActivePersons.get(i).getUserId()==userId){
				return allActivePersons.get(i);
			}
		}
		return null;
	}

	private static Person addPerson(int userId) {
		Person person = new Person(userId);
		allActivePersons.add(person);
		return person;
	}
}
