package com.byttersoft.util.tree;

import java.util.Map;

/**
 * @author ���پ�
 * �������β˵��ر��ļ�������
 */
public interface IEntity2Tree {
	/**
	 * @return ��ǰ���ڵ��ID
	 */
	public String getId();

	/**
	 * @return ��ǰ�ڵ�ĸ��ڵ��ID,�����ڵ㣨�����ڵ����ֻ��һ����Ҳ�����ж������ID������ó�toplevel
	 */
	public String getFatherId();

	/**
	 * @return ��ǰ�ڵ����ʾ�ı�
	 */
	public String getText();

	/**
	 * ExtJS
	 * @return �Ƿ�չ����ǰ�ڵ㣨��ʾ��ǰ�ڵ���ӽڵ㣩�������Ҷ�ӽڵ㣬�����Ա�������Ϊtrue
	 */
	public boolean getExpanded();
	/**
	 * EasyUI
	 * @return �Ƿ�չ����ǰ�ڵ㣨��ʾ��ǰ�ڵ���ӽڵ㣨open or closed�����������Ҷ�ӽڵ㣬�����Ա�������Ϊopen
	 */
	public String getState();

	/**
	 * @return ���ö������ʽ������null�����Ĭ����ʽ
	 */
	public String getIconCls();

	/**
	 * @return ��ǰ�ڵ��Ƿ���Ҷ�ӽڵ㣨û���ӽڵ�Ľڵ㣩
	 */
	public boolean getLeaf();
	/**
	 * @return �Ƿ�ѡ�иýڵ�,�ڶ�ѡʱ��������
	 */
	public boolean getChecked();
	
	/**
	 * @return ���ظ��������ڵ��ϵ�һЩ����
	 */
	public Map<String,String> getAttributes();
}