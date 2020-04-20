package oademo.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import oademo.entity.FolderFiles;

public interface FolderFilesMapper {
	List<FolderFiles> findAllFolders();
	List<FolderFiles> findFolderFilesByFolder(@Param ("folderId") int folderId);
	List<FolderFiles> findFolderFilesByPages(
			@Param ("folderId") int folderId,
			@Param ("name") String name,
			@Param ("startRow") int startRow,
			@Param ("maxRows") int maxRows
			);
	List<FolderFiles> findFolderFilesByName(
			@Param ("name") String name,
			@Param ("startRow") int startRow,
			@Param ("maxRows") int maxRows
			);
	int findTotalRows(
			@Param ("folderId") int folderId,
			@Param ("name") String name
			);
	int findTotalRowsName(
			@Param ("name") String name
			);
	FolderFiles findParentId(
			@Param ("folderId") int folderId
			);
	void updateFolderFilesName(
			@Param("name") String name,
			@Param("id") int id
			);
	String findFolderName(@Param("name") String name);
	void insertFolder(FolderFiles folder);
	void deleteFolder(@Param("id") int id);
	List<FolderFiles> findChildren(@Param("id") int id);
	FolderFiles findFolderFilesOne(@Param("id") int id);	
}
