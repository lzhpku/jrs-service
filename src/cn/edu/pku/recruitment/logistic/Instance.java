package cn.edu.pku.recruitment.logistic;


/**
* @author jh@pku
* version 1.0
**/

public class Instance {
	public int label;
	public int[] x;
	
	public Instance(int label, int[] x){
		this.label = label;
		this.x = x;
	}
	
	public int getLabel() {
		return label;
	}
	
	public int[] getX() {
		return x;
	}
}