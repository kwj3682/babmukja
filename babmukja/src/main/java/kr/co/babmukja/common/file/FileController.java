package kr.co.babmukja.common.file;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import kr.co.babmukja.repository.domain.FileVO;

@Controller("kr.co.babmukja.common.file.FileController")
@RequestMapping("/file")
public class FileController {
	
	@RequestMapping("/upload.do")
	public String fileupload(FileVO fileVO) throws Exception {
		for (MultipartFile file : fileVO.getAttach()) {
			if (file.isEmpty()) break;
			
			file.transferTo(new File("c:/bit2019/upload/" + file.getOriginalFilename()));
		}
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/store/mainpb.do";
	}
}
