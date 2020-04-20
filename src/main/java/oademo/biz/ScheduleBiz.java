package oademo.biz;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import oademo.entity.Schedule;

public interface ScheduleBiz {
	Schedule getAll();
	List<Schedule> findAll();
	Schedule findById(int id);
	List<Schedule> findByIdTitle(@Param("id") int id,@Param("title") String title,@Param("skips")int skips,@Param("size")int size);
	void add(Schedule schedule);
	void update(Schedule schedule);
	void delete(int id);
	int fetchscheduleRows(@Param("id") int id,@Param("title") String title);
}
