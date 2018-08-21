package com.jsp.project.travel;

import java.sql.Timestamp;

public class TravelBean {

	private int id; //분류
	private String title_img; //대표사진
	private String concept; //컨셉
	private String place; //장소
	private String place_e; //장소(영문)
	private String s_date; //출발날짜
	private String e_date; //도착날짜
	private String money; //예산
	private String trans; //교통수단
	private String people; //동행인 유무
	private String course; //계획
	private Timestamp add_date; //추가날짜
	
	public TravelBean() {
		
	}
	
	

	public TravelBean(int id, String title_img, String concept, String place, String place_e, String s_date,
			String e_date, String money, String trans, String people, String course, Timestamp add_date) {
		super();
		this.id = id;
		this.title_img = title_img;
		this.concept = concept;
		this.place = place;
		this.place_e = place_e;
		this.s_date = s_date;
		this.e_date = e_date;
		this.money = money;
		this.trans = trans;
		this.people = people;
		this.course = course;
		this.add_date = add_date;
	}



	public Timestamp getAdd_date() {
		return add_date;
	}



	public void setAdd_date(Timestamp add_date) {
		this.add_date = add_date;
	}



	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle_img() {
		return title_img;
	}

	public void setTitle_img(String title_img) {
		this.title_img = title_img;
	}

	public String getConcept() {
		return concept;
	}

	public void setConcept(String concept) {
		this.concept = concept;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getPlace_e() {
		return place_e;
	}

	public void setPlace_e(String place_e) {
		this.place_e = place_e;
	}

	public String getS_date() {
		return s_date;
	}

	public void setS_date(String s_date) {
		this.s_date = s_date;
	}

	public String getE_date() {
		return e_date;
	}

	public void setE_date(String e_date) {
		this.e_date = e_date;
	}

	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}

	public String getTrans() {
		return trans;
	}

	public void setTrans(String trans) {
		this.trans = trans;
	}

	public String getPeople() {
		return people;
	}

	public void setPeople(String people) {
		this.people = people;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}
	
	
}
