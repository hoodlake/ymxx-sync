package com.byttersoft.util.tree;

import java.util.Map;

/**
 * @author 张少举
 * 构成树形菜单必备的几个属性
 */
public interface IEntity2Tree {
	/**
	 * @return 当前树节点的ID
	 */
	public String getId();

	/**
	 * @return 当前节点的父节点的ID,顶级节点（顶级节点可能只有一个，也可能有多个）的ID最好设置成toplevel
	 */
	public String getFatherId();

	/**
	 * @return 当前节点的显示文本
	 */
	public String getText();

	/**
	 * ExtJS
	 * @return 是否展开当前节点（显示当前节点的子节点），如果是叶子节点，该属性必须设置为true
	 */
	public boolean getExpanded();
	/**
	 * EasyUI
	 * @return 是否展开当前节点（显示当前节点的子节点（open or closed）），如果是叶子节点，该属性必须设置为open
	 */
	public String getState();

	/**
	 * @return 设置定义的样式，返回null则采用默认样式
	 */
	public String getIconCls();

	/**
	 * @return 当前节点是否是叶子节点（没有子节点的节点）
	 */
	public boolean getLeaf();
	/**
	 * @return 是否选中该节点,在多选时才起作用
	 */
	public boolean getChecked();
	
	/**
	 * @return 返回附加在树节点上的一些属性
	 */
	public Map<String,String> getAttributes();
}