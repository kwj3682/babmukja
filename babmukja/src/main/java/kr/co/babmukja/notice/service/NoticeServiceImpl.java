package kr.co.babmukja.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.babmukja.repository.mapper.NoticeMapper;
import kr.co.babmukja.repository.vo.Notice;

@Service("kr.co.babmukja.notice.service.NoticeService")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	public NoticeMapper mapper;

	public List<Notice> retrieveNotice() throws Exception{
		return mapper.selectNotice();
	}
	@Transactional(rollbackFor = Exception.class)
	public void updateNotice(Notice notice) throws Exception{
        mapper.insertNotice(notice);
        
	}
}
