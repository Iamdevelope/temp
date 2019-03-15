package com.gl.action;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadBase;
import org.apache.commons.fileupload.ProgressListener;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.struts2.ServletActionContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gl.model.Manager;
import com.gl.service.ManagerService;
import com.gl.utils.PageBean;
import com.gl.utils.TimeHelper;
import com.gl.utils.UUIDUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ManagerSuperManagerAction extends ActionSupport implements ModelDriven<Manager> {
	private Manager manager=new Manager();
	@Override
	public Manager getModel() {
		System.out.println("超级管理员获取到了管理员的模型");
		return manager;
	}
	private ManagerService managerService;
	public void setManagerService(ManagerService managerService) {
		this.managerService=managerService;
	}
	private Integer page;
	public void setPage(Integer page) {
		this.page=page;
	}
	private String select;
	public void setSelect(String select){
		this.select=select;
	}
	private String excelPath;//Excel文件路径
	public void setExcelPath(String excelPath) {
		this.excelPath=excelPath;
	}
	
	public String info() {
		manager=managerService.findManangerById(manager.getMid());
		return "infoPage";
	}
	public String addPage() {
		List<Manager> mlist = managerService.findAllManagers();
		ActionContext.getContext().getValueStack().set("mlist", mlist);
		return "addPage";
	}
	public String importPage() {
		return "importPage";
	}
	public String delete() {
		managerService.delete(manager);
		return "deleteSuccess";
	}
	public String update() {
		System.out.println("正在更新用户信息。。。"+manager.getMid()+",phone:"+manager.getPhone_number()+",power:"+manager.getPower());
		managerService.update(manager);
		return "updateSuccess";
	}
	public String editPage() {
		System.out.println("正在跳转编辑页面...");
		manager=managerService.findManangerById(manager.getMid());
		return "editPage";
	}
	public String listPage() {
		return "listPage";
	}
	public String edit() {
		manager=managerService.findManangerById(manager.getMid());
		managerService.update(manager);
		return "editSuccess";
	}
	public String save() {
		manager.setCode(UUIDUtils.getUUID());
		manager.setCreate_time(TimeHelper.getCurrentTime());
		managerService.save(manager);
		return "saveSuccess";
	}
	public String findManagerAll() {
		PageBean<Manager> pageBean=managerService.findManagerByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findManagerAll";
	}
	public String select(){
		this.clearActionErrors();//每次运行时，将actionError清空
		if(select==null||select==""){
			this.addActionError("关键字为空：请重新输入！");
			return "findManagerAll";
		}
		System.out.println("搜索到了，关键字："+select+"当前页面为："+page);
		PageBean<Manager> pageBean = managerService.selectManagerByKey(select, page);
		if(pageBean==null){
			this.addActionError("查无结果，请检查关键字是否正确！");
			return "findManagerAll";
		}
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		System.out.println("搜索成功,共有   "+pageBean.getList().size()+"   个结果");
		return "selectSuccess";
	}
	public String importData() {
		//得到上传文件的保存目录，将上传的文件存放于WEB-INF目录下，不允许外界直接访问，保证上传文件的安全
        String savePath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/upload");
        //上传时生成的临时文件保存目录
        String tempPath = ServletActionContext.getServletContext().getRealPath("/WEB-INF/temp");
        File tmpFile = new File(tempPath);
        if (!tmpFile.exists()) {
            //创建临时目录
            tmpFile.mkdir();
        }
        
        //消息提示
        String message = "";
        String info="";
        
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpServletResponse response = ServletActionContext.getResponse();
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
		MultipartFile multipartFile = multipartRequest.getFile("CHANNEL_PACKAGE_URL");
		System.out.println("Excel文件名："+multipartFile.getOriginalFilename());
		try {
			InputStream in = multipartFile.getInputStream();
			
			return NONE;
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
			return NONE;
		}
        
        /*
        try{
            //使用Apache文件上传组件处理文件上传步骤：
            //1、创建一个DiskFileItemFactory工厂
            DiskFileItemFactory factory = new DiskFileItemFactory();
            //设置工厂的缓冲区的大小，当上传的文件大小超过缓冲区的大小时，就会生成一个临时文件存放到指定的临时目录当中。
            factory.setSizeThreshold(1024*1024*10);//设置缓冲区的大小为1M，如果不指定，那么缓冲区的大小默认是10KB
            //设置上传时生成的临时文件的保存目录
            factory.setRepository(tmpFile);
            //2、创建一个文件上传解析器
            ServletFileUpload upload = new ServletFileUpload(factory);
            //监听文件上传进度
            upload.setProgressListener(new ProgressListener(){
                public void update(long pBytesRead, long pContentLength, int arg2) {
                    System.out.println("文件大小为：" + pContentLength + ",当前已处理：" + pBytesRead);
                    *//**
                     * 文件大小为：14608,当前已处理：23424
                     *//*
                }
            });
             //解决上传文件名的中文乱码
            upload.setHeaderEncoding("UTF-8"); 
            //3、判断提交上来的数据是否是上传表单的数据
            if(!ServletFileUpload.isMultipartContent(request)){
                //按照传统方式获取数据
                return NONE;
            }
            
            //设置上传单个文件的大小的最大值，目前是设置为1024*1024字节，也就是1MB
            upload.setFileSizeMax(1024*1024*10);
            //设置上传文件总量的最大值，最大值=同时上传的多个文件的大小的最大值的和，目前设置为10MB
            upload.setSizeMax(1024*1024*10);
            FileItemIterator iterator = upload.getItemIterator(request);
            
            StringBuffer fileContent=new StringBuffer();
            while(iterator.hasNext()) {
                FileItemStream itemStream=iterator.next();//从集合中获得一个文件流
                if(!itemStream.isFormField() && itemStream.getName().length() > 0) {    //过滤掉表单中非文件
                    BufferedInputStream inputStream=new BufferedInputStream(itemStream.openStream());   //获得文件输入流
                    inputStream.mark(itemStream.openStream().available()+1);
                    //判断上传的文件的编码格式 支持 UTF-8 和 ANSI两种类型
                    String charsetName=getFileCharsetName(inputStream);

                    BufferedReader bufferedReader=new BufferedReader(new InputStreamReader(inputStream,charsetName));
                    String lineTxt=null;
                    while((lineTxt=bufferedReader.readLine()) != null) {
                        fileContent.append(lineTxt+"\r");
                    }
                }
            }
            System.out.println(fileContent.toString());
            
            
            //4、使用ServletFileUpload解析器解析上传数据，解析结果返回的是一个List<FileItem>集合，每一个FileItem对应一个Form表单的输入项
            List<FileItem> list = upload.parseRequest(request);
            for(FileItem item : list){
                //如果fileitem中封装的是普通输入项的数据
                if(item.isFormField()){
                    String name = item.getFieldName();
                    //解决普通输入项的数据的中文乱码问题
                    String value = item.getString("UTF-8");
                    //value = new String(value.getBytes("iso8859-1"),"UTF-8");
                    System.out.println(name + "=" + value);
                }else{//如果fileitem中封装的是上传文件
                    //得到上传的文件名称，
                    String filename = item.getName();
                    System.out.println(filename);
                    if(filename==null || filename.trim().equals("")){
                        continue;
                    }
                    //注意：不同的浏览器提交的文件名是不一样的，有些浏览器提交上来的文件名是带有路径的，如：  c:\a\b\1.txt，而有些只是单纯的文件名，如：1.txt
                    //处理获取到的上传文件的文件名的路径部分，只保留文件名部分
                    filename = filename.substring(filename.lastIndexOf("\\")+1);
                    //得到上传文件的扩展名
                    String fileExtName = filename.substring(filename.lastIndexOf(".")+1);
                    //如果需要限制上传的文件类型，那么可以通过文件的扩展名来判断上传的文件类型是否合法
                    System.out.println("上传的文件的扩展名是："+fileExtName);
                    //获取item中的上传文件的输入流
                    InputStream in = item.getInputStream();
                    //得到文件保存的名称
                    String saveFilename = makeFileName(filename);
                    //得到文件的保存目录
                    String realSavePath = makePath(saveFilename, savePath);
                    //文件全路径
                    String filePath = realSavePath + "\\" + saveFilename;
                    //创建一个文件输出流
                    FileOutputStream out = new FileOutputStream(filePath);
                    //创建一个缓冲区
                    byte buffer[] = new byte[1024];
                    //判断输入流中的数据是否已经读完的标识
                    int len = 0;
                    //循环将输入流读入到缓冲区当中，(len=in.read(buffer))>0就表示in里面还有数据
                    while((len=in.read(buffer))>0){
                        //使用FileOutputStream输出流将缓冲区的数据写入到指定的目录(savePath + "\\" + filename)当中
                        out.write(buffer, 0, len);
                    }
                    //关闭输入流
                    in.close();
                    //关闭输出流
                    out.close();
                    //删除处理文件上传时生成的临时文件
                    item.delete();
                    //ProPriChangeAction proPriChangeAction = new ProPriChangeAction();//读取excel的类，并进行数据保存操作，并返回string（提示信息）
//                    String result = proPriChangeAction.readExcel(filePath);
//                    if(result!=""){
//                    	info = result+"的数据已存在，请进行修改操作！";
//                    }
                    message = "文件上传成功！";
                }
            }
        }catch (FileUploadBase.FileSizeLimitExceededException e) {
            e.printStackTrace();
            System.out.println("单个文件超出最大值");
            request.setAttribute("message", "单个文件超出最大值！！！");
            try {
				request.getRequestDispatcher("/page/message.jsp").forward(request, response);
			} catch (ServletException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
            return NONE;
        }catch (FileUploadBase.SizeLimitExceededException e) {
            e.printStackTrace();
            System.out.println("上传文件的总的大小超出限制的最大值");
            request.setAttribute("message", "上传文件的总的大小超出限制的最大值！！！");
            try {
				request.getRequestDispatcher("/page/message.jsp").forward(request, response);
			} catch (ServletException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
            return NONE;
        }catch (Exception e) {
            message= "文件上传失败！";
            e.printStackTrace();
        }
        request.setAttribute("message",message);
        request.setAttribute("info",info);
        try {
			request.getRequestDispatcher("/page/message.jsp").forward(request, response);
		} catch (ServletException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
        return NONE;
		*/
	}

    /**
    * @Method: makeFileName
    * @Description: 生成上传文件的文件名，文件名以：uuid+"_"+文件的原始名称
    * @param filename 文件的原始名称
    * @return uuid+"_"+文件的原始名称
    */ 
    private String makeFileName(String filename){  //2.jpg
        //为防止文件覆盖的现象发生，要为上传文件产生一个唯一的文件名
        return UUID.randomUUID().toString() + "_" + filename;
    }
    
    /**
             *   为防止一个目录下面出现太多文件，要使用hash算法打散存储
    * @param filename 文件名，要根据文件名生成存储目录
    * @param savePath 文件存储路径
    * @return 新的存储目录
    */ 
    private String makePath(String filename,String savePath){
        //得到文件名的hashCode的值，得到的就是filename这个字符串对象在内存中的地址
        int hashcode = filename.hashCode();
        int dir1 = hashcode&0xf;  //0--15
        int dir2 = (hashcode&0xf0)>>4;  //0-15
        //构造新的保存目录
        String dir = savePath + "\\" + dir1 + "\\" + dir2;  //upload\2\3  upload\3\5
        //File既可以代表文件也可以代表目录
        File file = new File(dir);
        //如果目录不存在
        if(!file.exists()){
            //创建目录
            file.mkdirs();
        }
        return dir;
    }
    
    //判断上传的文件的编码格式 支持 UTF-8 和 ANSI两种类型
    private String getFileCharsetName(InputStream inputStream) throws IOException{
        String charsetName="GBK";
        byte[] typeByte = new byte[3];

        inputStream.read(typeByte);
        if (typeByte[0] == -17 && typeByte[1] == -69 && typeByte[2] == -65){
            charsetName="UTF-8";
        }
        else{
            charsetName="GBK";
        }
        inputStream.reset();
        return charsetName;
    }
}
