package oademo.web.restcontroller;

import static org.hamcrest.CoreMatchers.nullValue;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.weaver.ast.Var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import oademo.biz.FolderFilesBiz;
import oademo.entity.FolderFiles;
import oademo.mapper.FolderFilesMapper;

@RestController
public class FolderFilesRestController {
	@Autowired
	private FolderFilesBiz folderFilesBiz;
	@Autowired
	private FolderFilesMapper folderFilesMapper;
	@RequestMapping("/select-folder-files")
	public List<FolderFiles> folderFiles() {
		return folderFilesBiz.findAllFolders();
	}

	@RequestMapping("/select-folder-files-children")
	public Map<String, Object> folderFilesChildren(Integer folderId,String name,int start,int length) {
		folderId=folderId==null?0:folderId;
		
		List<FolderFiles> folderFiles=folderFilesBiz.findFolderFilesByPages(folderId,name,start,length);
		Map<String, Object> map=new HashMap<String, Object>();
		int totalRows=folderFilesBiz.findTotalRows(folderId, name);
		map.put("recordsTotal", totalRows);
		map.put("recordsFiltered", totalRows);
		map.put("data", folderFiles);
		System.out.println(folderId);
		return map;
	}
	@RequestMapping("/select-folder-files-name")
	public Map<String, Object> folderFilesName(String name,int start,int length) {
		
		List<FolderFiles> folderFiles=folderFilesBiz.findFolderFilesByName(name,start,length);
		Map<String, Object> map=new HashMap<String, Object>();
		int totalRows=folderFilesBiz.findTotalRowsName(name);
		map.put("recordsTotal", totalRows);
		map.put("recordsFiltered", totalRows);
		map.put("data", folderFiles);
		return map;
	}
	
	@RequestMapping("/select-folder-files-parentId")
	public FolderFiles findParent(Integer folderId) {
		folderId=folderId==null?0:folderId;
		FolderFiles f=folderFilesBiz.findParentId(folderId);
		return f;
	}
	//检查文件名是否重复
	@RequestMapping("/check-name")
	public Boolean checkName(String name) {
		String message=folderFilesMapper.findFolderName(name);	
		if (message!=null) {
			return false;
		}else {
			return true;
		}

	}
	
	//修改文件夹名字
	@RequestMapping(value = "/update-name",method = RequestMethod.POST,produces ="text/html; charset=utf-8" )
	public String updateName(Integer id,String name) {
		id=id==null?0:id;
		String message=folderFilesBiz.updateFolderFilesName(name, id);
		return message;
	}
	//添加文件夹
	@RequestMapping("/insert-folder")
	public void insertFolder(String name,String description,String type,Integer id,MultipartFile filesAnnex,HttpServletRequest request ) throws IllegalStateException, IOException {
		id=id==null?0:id;
		int parentId=0;
		
		if (type.equals("文件")) {
			type="folder";
			if (id!=0) {
				parentId=folderFilesBiz.findParentId(id).getId();
				folderFilesBiz.insertFolder(new FolderFiles(0, name, description, type, null, 1, new Date(), parentId, 1,"0kb"));
			}
		}
		
		if (type.equals("文档")) {
			type="files";
			if (!filesAnnex.isEmpty()) {
				String ext= filesAnnex.getOriginalFilename().substring(filesAnnex.getOriginalFilename().lastIndexOf("."));
				//name=filesAnnex.getOriginalFilename();
				String path=request.getServletContext().getInitParameter("staticPath")+"\\files\\"+name;
				File fileInto=new File(path);
				long length = filesAnnex.getSize()/1024;//获取文件大小，单位：字节
				filesAnnex.transferTo(fileInto);
				
				if (id!=0) {
					parentId=folderFilesBiz.findParentId(id).getId();
					folderFilesBiz.insertFolder(new FolderFiles(0, name, description, type, path, 1, new Date(), parentId, 1,length+"kb"));
				}
			} 
			
		}
	}
	//删除文件
	@RequestMapping(value = "/delete-folder",method = RequestMethod.POST,produces = "text/html; charset=utf-8")
	public String deleteFolder(Integer id) {
		id=id==null?0:id;
		String message=folderFilesBiz.deleteFolder(id);
		return message;
	}
	//验证type
	@RequestMapping("/check-type")
	public FolderFiles checkType(Integer id) {
		id=id==null?0:id;
		return folderFilesBiz.findFolderFilesOne(id);
	}
	//读取文件
	@RequestMapping("/read-files")
    public String txt2String(File file) {
		File file2=new File("D:\\SpringMVC_Nginx\\web-static\\static\\files\\Test2.docx");
        StringBuilder result = new StringBuilder();
        try {
            BufferedReader br = new BufferedReader(new FileReader(file));// 构造一个BufferedReader类来读取文件
            String s = null;
            while ((s = br.readLine()) != null) {// 使用readLine方法，一次读一行
                result.append(System.lineSeparator() + s);
            }
            br.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result.toString();
    }
}
