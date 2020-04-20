package oademo.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import oademo.entity.FolderFiles;

public interface FolderFilesBiz {
	List<FolderFiles> findAllFolders();
	List<FolderFiles> findFolderFilesByFolder(int folderId);
	List<FolderFiles> findFolderFilesByPages(int folderId,String name,int startRow,int maxRows);
	int findTotalRows(int folderId, String name);
	List<FolderFiles> findFolderFilesByName(String name,int startRow,int maxRows);
	int findTotalRowsName(String name);
	FolderFiles findParentId(int folderId);
	String updateFolderFilesName(String name,int id);
	//添加文件夹
	void insertFolder(FolderFiles folder);
	//删除文件夹
	String deleteFolder(int id);
	FolderFiles findFolderFilesOne(int id);

		
}
