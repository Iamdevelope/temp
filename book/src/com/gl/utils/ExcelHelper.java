package com.gl.utils;

import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.struts2.ServletActionContext;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

import com.gl.model.ColumnInfo;

import net.sf.json.JSONArray;;

public class ExcelHelper {

	/**
	 * 判断某行是否为空
	 * @return
	 */
	public static boolean isEmptyRow(HSSFRow row) {
		boolean flag = true;
		for (int i = 0; i < row.getLastCellNum(); i++) {
			HSSFCell cell = row.getCell(i);
			if(cell != null){
				if(StringUtils.isNotBlank(cell.toString())){
					return false;
				}
			}
		}
		
		return flag;
	}
	/**
	 * 获取单元格值，并且进行校验
	 * @param cell
	 * @param td
	 * @return
	 */
	public static String getCellValue(HSSFCell cell, Element td) {
		//首先获取单元格位置
		int i = cell.getRowIndex() + 1;
		int j = cell.getColumnIndex()+1;
		String returnValue = "";//返回值
		
		try {
			//获取模板文件对单元格格式限制
			String type = td.getAttribute("type").getValue();
			boolean isNullAble = td.getAttribute("isnullable").getBooleanValue();
			int maxlength = 9999;
			
			if(td.getAttribute("maxlength")!=null){
				maxlength = td.getAttribute("maxlength").getIntValue();
			}
			String value = null;
			//根据格式取出单元格的值
			switch (cell.getCellType()) {
				case HSSFCell.CELL_TYPE_STRING:{
					value = cell.getStringCellValue();
					break;
				}
				case HSSFCell.CELL_TYPE_NUMERIC:{
					if("datetime,date".indexOf(type)>=0){
						Date date = cell.getDateCellValue();
						SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
						value = df.format(date);
					}else{
						double numericCellValue = cell.getNumericCellValue();
						value = String.valueOf(numericCellValue);
						//将数字的科学计数转成字符
						if((""+value).indexOf("E")!=-1||(""+value).indexOf("e")!=-1||(""+value).indexOf("+")!=-1) {
							BigDecimal bd = new BigDecimal(Double.parseDouble(value));
							value=bd.toString();
						}
					}
					break;
				}
			}
			
			//对非空、长度进行校验
			if(!isNullAble && StringUtils.isBlank(value)){
				//错误编码,错误位置原因,单位格的值
				returnValue = "#0001,第" + i + "行第" +j +"列不能为空！," + value;
			}else if(StringUtils.isNotBlank(value) && (value.length()>maxlength)){
				returnValue = "#0002,第" + i + "行第" +j +"列长度超过最大长度！," + value;
			}else{
				returnValue =  value;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return returnValue;
	}
	/**
	 * 动态获取表头信息
	 */
	public static void columns(String templateId){
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		//获取表头信息
		List<ColumnInfo> list = getColumns(templateId);
		//转换json对象返回
		String json ="["+ JSONArray.fromObject(list).toString() + "]";
		try {
			response.getWriter().write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	/**
	 * 动态获取表头
	 * @return
	 */
	public static List<ColumnInfo> getColumns(String templateId) {
		List<ColumnInfo> list = new ArrayList<ColumnInfo>();
		//获取模板文件
		String path = ServletActionContext.getServletContext().getRealPath("/template");
		path = path + "\\" + templateId + ".xml";
		File file = new File(path);
		
		//解析模板文件
		SAXBuilder builder = new SAXBuilder();
		try {
			Document parse = builder.build(file);
			Element root = parse.getRootElement();
			Element thead = root.getChild("thead");
			Element tr = thead.getChild("tr");
			List<Element> children = tr.getChildren();
			
			ColumnInfo c = new ColumnInfo();
			//添加处理标志、失败代码，失败说明
			c = createColumnInfo("cgbz","处理标志",120,"center");
			list.add(c);
			c = createColumnInfo("hcode","失败代码",120,"center");
			list.add(c);
			c = createColumnInfo("msg","失败说明",120,"center");
			list.add(c);
			for (int i = 0; i < children.size(); i++) {
				Element th = children.get(i);
				String value = th.getAttribute("value").getValue();
				c = createColumnInfo("col"+i,value,120,"center");
				list.add(c);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return list;
	}
	/**
	 * 创建column对象
	 * @param string
	 * @param string2
	 * @param i
	 * @param string3
	 */
	public static ColumnInfo createColumnInfo(String fieldId, String title, int width,
			String align) {
		ColumnInfo c = new ColumnInfo();
		c.setField(fieldId);
		c.setTitle(title);
		c.setWidth(width);
		c.setAlign(align);
		return c;
	}
	/**
	 * 确认导入
	 */
	public static void doimport(){
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=utf-8");
		//将导入的明细数据已到student表中
		//importDataService.saveStudents(importDataId);
		//修改主表、明细表处理标志及时间
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateNow = sf.format(new Date());
		//importDataService.updImportDataStatus(dateNow, importDataId);
		//importDataService.updImportDataDetailStatus(importDataId);
		String str = "{\"status\":\"ok\",\"message\":\"确认成功！\"}";
		try {
			response.getWriter().write(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
