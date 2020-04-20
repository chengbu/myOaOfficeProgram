package oademo.biz.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import oademo.biz.ScheduleBiz;
import oademo.entity.Schedule;
import oademo.mapper.ScheduleMapper;

@Service
public class ScheduleBizImpl implements ScheduleBiz {

	@Autowired
	private ScheduleMapper schedulemapper;
	
	@Override
	public Schedule getAll() {
		// TODO Auto-generated method stub
		return schedulemapper.getAll();
	}

	@Override
	public List<Schedule> findAll() {
		// TODO Auto-generated method stub
		return schedulemapper.findAll();
	}

	@Override
	public Schedule findById(int id) {
		// TODO Auto-generated method stub
		return schedulemapper.findById(id);
	}

	@Override
	public List<Schedule> findByIdTitle(int id, String title, int skips, int size) {
		// TODO Auto-generated method stub
		return schedulemapper.findByIdTitle(id, title, (skips-1)*size, size);
	}

	@Override
	public void add(Schedule schedule) {
		// TODO Auto-generated method stub
		schedulemapper.add(schedule);
	}

	@Override
	public void update(Schedule schedule) {
		// TODO Auto-generated method stub
		schedulemapper.update(schedule);
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		schedulemapper.delete(id);
	}

	@Override
	public int fetchscheduleRows(int id, String title) {
		// TODO Auto-generated method stub
		return schedulemapper.fetchscheduleRows(id, title);
	}

}
