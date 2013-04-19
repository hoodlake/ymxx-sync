//指定实现该接口的类的那些字段作为相应的返回字段
public interface Entity2TreeInter {
	public String getId();
	public String getFatherId();
	public String getText();
	public boolean getExpanded();
	public String getCls();
	public boolean getLeaf();
	//public boolean getChecked();
}
