package com.byttersoft.util.tree;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.byttersoft.framework.util.StringUtil;
import net.sf.json.JSONArray;

/**
 * @author 张少举
 * 将有层级关系的类对象转换成easyUI或者extJS 构成树形组件 所需要的json字符串
 */
public class Entity2TreeUtils {
	private String id;
	private String text;
	private String iconCls;
	private boolean leaf;
	private boolean expanded;
	private boolean checked;
	private String state;
	private Map<String, String> attributes;
	private List<Entity2TreeUtils> children;

	/**
	 * 
	 */
	private Entity2TreeUtils() {
		super();
	}

	/**
	 * @param id
	 * @param text
	 * @param cls
	 * @param leaf
	 * @param expanded
	 * @param children
	 */
	private Entity2TreeUtils(String id, String text, String cls, boolean leaf,
			boolean expanded, List<Entity2TreeUtils> children) {
		super();
		this.id = id;
		this.text = text;
		this.iconCls = cls;
		this.leaf = leaf;
		this.expanded = expanded;
		this.children = children;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public boolean isLeaf() {
		return leaf;
	}

	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}

	public boolean isExpanded() {
		return expanded;
	}

	public void setExpanded(boolean expanded) {
		this.expanded = expanded;
	}

	public List<Entity2TreeUtils> getChildren() {
		return children;
	}

	public void setChildren(List<Entity2TreeUtils> children) {
		this.children = children;
	}

	
	
	public boolean isChecked() {
		return checked;
	}

	public void setChecked(boolean checked) {
		this.checked = checked;
	}

	public Map<String, String> getAttributes() {
		return attributes;
	}

	public void setAttributes(Map<String, String> attributes) {
		this.attributes = attributes;
	}
	
	

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	/**
	 * @param e2tList
	 * @param rootNode
	 * @return
	 */
	public static <T extends IEntity2Tree> String getTreeJsonString(
			List<T> e2tList, String rootNode) {
		Map<String, List<Entity2TreeUtils>> arrayListMap = new HashMap<String, List<Entity2TreeUtils>>();
		// 帮孩子节点找到父节点，形成若干单独的树
		// 所有节点的父节点不允许为null，如果没有父节点，请在getFathterId方法里返回字符串
		// "toplevel",即最上级的节点的父节点ID要设置为toplevel
		for (int i = 0; i < e2tList.size(); i++) {
			T t = e2tList.get(i);
			IEntity2Tree e = (IEntity2Tree) t;
			Entity2TreeUtils e2t = new Entity2TreeUtils();
			e2t.setId(e.getId());
			e2t.setIconCls(e.getIconCls());
			e2t.setText(e.getText());
			e2t.setLeaf(e.getLeaf());
			e2t.setState(e.getState());
			e2t.setExpanded(e.getExpanded());

			String fatherId = e.getFatherId();
			if (arrayListMap.get(fatherId) == null) {
				List<Entity2TreeUtils> list = new ArrayList<Entity2TreeUtils>();
				list.add(e2t);
				arrayListMap.put(fatherId, list);
			} else {
				List<Entity2TreeUtils> valueList = arrayListMap.get(fatherId);
				valueList.add(e2t);
				arrayListMap.put(fatherId, valueList);
			}
		}

		// 在树之间根据设置父子关系
		for (Map.Entry<String, List<Entity2TreeUtils>> entry : arrayListMap.entrySet()) {
			
			List<Entity2TreeUtils> smallTreeList = new ArrayList<Entity2TreeUtils>();
			smallTreeList = entry.getValue();
			int nodeListSize = smallTreeList.size();
			for (int i = 0; i < nodeListSize; i++) {
				String findID = smallTreeList.get(i).getId();
				List<Entity2TreeUtils> findList = arrayListMap.get(findID);
				smallTreeList.get(i).setChildren(findList);
			}
		}
		rootNode = StringUtil.isBlank(rootNode) ? "toplevel" : rootNode;
		List<Entity2TreeUtils> rootNodeList = arrayListMap.get(rootNode);

		JSONArray jsonArray = JSONArray.fromObject(rootNodeList);
		String jsonTree = jsonArray.toString();
		//System.out.println(jsonTree);
		return jsonTree;
	}
}