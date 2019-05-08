package kr.co.babmukja.notice.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.babmukja.repository.vo.Notice;

@Service("kr.co.babmukja.notice.service.NoticeService")
public interface NoticeService {
	public List<Notice> retrieveNotice() throws Exception;
	void updateNotice(Notice notice) throws Exception;
}
