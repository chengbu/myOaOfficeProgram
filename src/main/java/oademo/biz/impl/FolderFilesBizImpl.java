package oademo.biz.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oademo.biz.FolderFilesBiz;
import oademo.entity.FolderFiles;
import oademo.mapper.FolderFilesMapper;
@Service
public class FolderFilesBizImpl implements FolderFilesBiz{
	@Autowired
	private FolderFilesMapper folderFilesMapper;
	@Override
	public List<FolderFiles> findAllFolders() {
		List<FolderFiles> list=folderFilesMapper.findAllFolders();
		int parentId=0;
		return assembleFolderFiles(list, parentId); 
	}
	@Override
	public List<FolderFiles> findFolderFilesByFolder(int folderId) {
		int parentId=folderId;
		List<FolderFiles> list= folderFilesMapper.findFolderFilesByFolder(parentId);
		return assembleFolderFiles(list, parentId);
	}
//	@Override
//	public List<FolderFiles> findFolderFilesByFolder(int folderId) {
//		return folderFilesMapper.findFolderFilesByFolder(folderId);
//	}
	
	private List<FolderFiles> assembleFolderFiles(List<FolderFiles> list,int parentId){
		List<FolderFiles> folderFiles=new ArrayList<FolderFiles>();
		for(FolderFiles f:list) {
			if (f.getParentId()==parentId) {
				folderFiles.add(f);
				f.setChildren(assembleFolderFiles(list, f.getId()));
			}
		}
		return folderFiles;
	}
	@Override
	public List<FolderFiles> findFolderFilesByPages(int folderId, String name, int startRow, int maxRows) {
		List<FolderFiles> list=folderFilesMapper.findFolderFilesByPages(folderId, name, startRow, maxRows);
		return list;
	}
	@Override
	public int findTotalRows(int folderId, String name) {
		int sum=folderFilesMapper.findTotalRows(folderId, name);
		return sum;
	}
	@Override
	public List<FolderFiles> findFolderFilesByName(String name, int startRow, int maxRows) {
		return folderFilesMapper.findFolderFilesByName(name, startRow, maxRows);
	}
	@Override
	public int findTotalRowsName(String name) {
		return folderFilesMapper.findTotalRowsName(name);
	}
	@Override
	public FolderFiles findParentId(int folderId) {
		return folderFilesMapper.findParentId(folderId);
	}
	@Override
	public String updateFolderFilesName(String name, int id) {
			String cname=folderFilesMapper.findFolderName(name);
			if (cname!=null&&cname.equals(name)) {
				return "该名字已被使用，请重新指定";
			}else {
				folderFilesMapper.updateFolderFilesName(name, id);
				return null;
			}
	}
	//新建文件夹
	@Override
	public void insertFolder(FolderFiles folder) {
		folderFilesMapper.insertFolder(folder);
	}
	//删除文件夹
	@Override
	public String deleteFolder(int id) {
		List<FolderFiles> folderFiles=folderFilesMapper.findChildren(id);
		if (folderFiles.size()>0) {
			return "该文件正在被其他文件使用，请先删除依赖文件！";
		}else {
			folderFilesMapper.deleteFolder(id);
			return null;
		}
		
	}
	@Override
	public FolderFiles findFolderFilesOne(int id) {
		return folderFilesMapper.findFolderFilesOne(id);
	}

}
