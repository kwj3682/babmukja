package kr.co.babmukja.store.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.google.gson.Gson;

import kr.co.babmukja.repository.domain.FileVO;
import kr.co.babmukja.repository.domain.Member;
import kr.co.babmukja.repository.domain.Pagepb;
import kr.co.babmukja.repository.domain.ReviewFileVO;
import kr.co.babmukja.repository.domain.ReviewMap;
import kr.co.babmukja.repository.domain.StorePB;
import kr.co.babmukja.repository.domain.StorePBCart;
import kr.co.babmukja.repository.domain.StorePBInquire;
import kr.co.babmukja.repository.domain.StorePBLike;
import kr.co.babmukja.repository.domain.StorePBPayment;
import kr.co.babmukja.repository.domain.StorePBReview;
import kr.co.babmukja.store.service.StorePBService;

@Controller("kr.co.babmukja.store.controller.StorePBController")
@RequestMapping("/store")
public class StorePBController {
	
	@Autowired
	private StorePBService service;
	
	/*
	@RequestMapping("/mainpb.do")
	public void selectPBList(Model model, StorePB storepb) {
		model.addAttribute("pbList", service.selectPBMainList());
	}
	
	@RequestMapping("/detailpb.do")
	public void detailpb(StorePB storepb, Model model) {
		model.addAttribute("detailpb", service.selectPBdetail(storepb.getPbNo()));
		model.addAttribute("detailpbIamge", service.selectPBDetailImage(storepb.getGroupNo()));
	}
	
	@RequestMapping("/insertformpb.do")
	public void insertformpb() {}
	
	@RequestMapping("/insertpb.do")
	public String insertpb(FileVO fileVO,StorePB storepb) throws Exception{
		
		String uploadRoot = "c:/bit2019/upload";
		SimpleDateFormat sdf = new SimpleDateFormat(
				"/yyyy/MM/dd"
		);
		
		String path = "/pbstore" + sdf.format(new Date());
		File file = new File(uploadRoot + path);
		if (file.exists() == false) file.mkdirs();
		int max = service.getMax();
		
		for (MultipartFile mFile : fileVO.getImageList()) {
			if (mFile.isEmpty()) {
				break;
			}
			String uName =  UUID.randomUUID().toString();
			mFile.transferTo(new File(uploadRoot + path + "/" + uName));
			
			//fileVO.setGroupNo(storepb.getGroupNo());
			//1. max 값 가져오기
			//2. max값을 fileVO에 넣기
			fileVO.setGroupNo(max);
			
			//3. insertImage( <- max값을 포함한 fileVO 넣기)
			fileVO.setPath(path);
			fileVO.setOrgname(mFile.getOriginalFilename());
			fileVO.setSysname(uName);
			service.insertPBImage(fileVO);

		}
		storepb.setGroupNo(fileVO.getGroupNo());
		service.insertpb(storepb);
		
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "mainpb.do";
	}

	@RequestMapping("/deletepb.do")
	public String deletePBByNo(StorePB storepb) {
		service.deletePBByNo(storepb.getPbNo());
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "mainpb.do";
	}
	*/

	// 아래부 editor js 테스트
	
	// pb main
	@RequestMapping("/mainpb.do")
	public void mainpb(Model model) {
		List<StorePB> list = service.selectPBStore();
		List<StorePB> result = new ArrayList<>();
		for (StorePB storepb : list) {
			String imgpath = "";
			
			if(storepb.getImgPath() == null) {
				imgpath = "/babmukja/store/downloadpb.do?path=/&sysname=default.png";
				storepb.setImgPath(imgpath);
				result.add(storepb);
//				System.out.println(imgpath);
				continue;
			}
//			System.out.println(imgpath);
			String[] imgList = storepb.getImgPath().split(",");
			storepb.setImgPath(imgList[0]);
			result.add(storepb);
		}
		model.addAttribute("storepb", result);
	}
	
	// pb 상품 리스트
	@RequestMapping("/listpb.do")
	public void listpb(Model model, Pagepb page) {
		Map<String, Object> result = service.selectPBStoreList(page);
		model.addAttribute("listpb", result.get("list"));
		model.addAttribute("pageResult", result.get("pageResult"));
		model.addAttribute("sortType", result.get("sortType"));
		model.addAttribute("pbCount", service.selectPBStoreCount(page));
	}
	
	// pb 상품 상세조회
	@RequestMapping("/detailpb.do")
	public ModelAndView detailpb(ModelAndView mav, int pbNo, StorePBReview storePBReview, StorePBInquire storePBInquire, HttpSession session) {
		StorePB store = service.selectPBStoreByNo(pbNo);
		service.addViewCnt(pbNo);
		List<StorePBInquire> sInquire = service.selectPBInquire(pbNo);
		List<StorePBReview> reviewList = service.selectReview(pbNo);
		List<ReviewMap> reviewMap = new ArrayList<>();
		for(StorePBReview pb : reviewList) {
			
			List<ReviewFileVO> reviewFileList = service.selectReviewFile(pb.getPbReviewNo());
			ReviewMap rm = new ReviewMap();
			rm.setReviewFile(reviewFileList);
			rm.setReviewList(pb);
			rm.setMember(pb.getMember());
			reviewMap.add(rm);
		}
		
		if (store == null) {
			System.out.println("store is null !!!");
			mav.setViewName("store/mainpb");
			return mav;
		}
		
		if (store.getImgPath() == null ) {
			
			mav.setViewName("store/detailpb");
			mav.addObject("store");
			mav.addObject("imgList",  "/babmukja/store/downloadpb.do?path=/&sysname=default.png");
			return mav;
		}
		
		Member user = (Member)session.getAttribute("user");
		if (user != null) {
			StorePBLike like = new StorePBLike();
			like.setMemNo(user.getMemNo());
			like.setPbNo(store.getPbNo());
			mav.addObject("likeStatus", service.selectLikeStatus(like));
		}
		
		mav.setViewName("store/detailpb");
		mav.addObject("storepb", store);
		mav.addObject("imgList", store.getImgPath().split(","));
		mav.addObject("reviewList", reviewList);
		mav.addObject("reviewMap",reviewMap);
		mav.addObject("inqList", sInquire);
		return mav;
	}
	
	// pb 상품 수정 폼
	@RequestMapping("/updateformpb.do")
	public void updatepbform(Model model, int pbNo) {
		model.addAttribute("storepb", service.updateFormPBStore(pbNo));
	}
	
	// pb 상품 수정
	@RequestMapping("/updatepb.do")
	public String updatepb(StorePB storepb) {
		service.updatePBStore(storepb);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "/admin/pbstoreselectlist.do";
	}
	
	// 파일 처리 
	@RequestMapping("/downloadpb.do")
	@ResponseBody
	public void downloadpb(FileVO fileVO, HttpServletResponse response) throws Exception{
		String uploadRoot = "c:/bit2019/upload";
		String path = fileVO.getPath();
		String sysname = fileVO.getSysname();
		
		File f = new File(uploadRoot + path + "/" + sysname);
		
		response.setHeader("Content-Type", "image/jpg"); 
		
		FileInputStream fis = new FileInputStream(f);
		BufferedInputStream bis = new BufferedInputStream(fis);
		
		OutputStream out = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);
		
		while (true) {
			int ch = bis.read();	
			if (ch == -1) break;	
			bos.write(ch);   
		}

		bis.close();  fis.close();
		bos.close();  out.close();
	}

	@RequestMapping("/uploadpb.do")
	@ResponseBody
	public Object uploadpb(FileVO fileVO) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat(
				"/yyyy/MM/dd"
		);
		String uploadRoot = "C:/bit2019/upload";
		String path = "/pbstore" + sdf.format(new Date());
		File file = new File(uploadRoot + path);
		if (file.exists() == false) file.mkdirs();
		System.out.println("create root : " + uploadRoot + path + "/ <- file name here");
		
		MultipartFile mFile = fileVO.getAttach();
		
		String uName =  UUID.randomUUID().toString() + mFile.getOriginalFilename();
		mFile.transferTo(new File(uploadRoot + path + "/" + uName));

		
		fileVO.setPath(path);
		fileVO.setOrgname(mFile.getOriginalFilename());
		fileVO.setSysname(uName);
		System.out.println("file upload succeed.");

		return new Gson().toJson(fileVO);
	}

	@RequestMapping("/reviewuploadpb.do")
	@ResponseBody
	public Object reviewuploadpb(FileVO fileVO) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat(
				"/yyyy/MM/dd"
				);
		String uploadRoot = "C:/bit2019/upload";
		String path = "/pbreview" + sdf.format(new Date());
		File file = new File(uploadRoot + path);
		if (file.exists() == false) file.mkdirs();
		System.out.println("create root : " + uploadRoot + path + "/ <- file name here");
		
		MultipartFile mFile = fileVO.getAttach();
		
		String uName =  UUID.randomUUID().toString() + mFile.getOriginalFilename();
		mFile.transferTo(new File(uploadRoot + path + "/" + uName));
		
		fileVO.setPath(path);
		fileVO.setOrgname(mFile.getOriginalFilename());
		fileVO.setSysname(uName);
		System.out.println("file upload succeed.");
		
		return new Gson().toJson(fileVO);
	}
	
	// pb 상품 후기  등록
	@RequestMapping("/pbreviewinsert.do")
	@ResponseBody
	public double pbreviewinsert(ReviewFileVO fileVO, StorePBReview reviewpb, int ratingCnt, double storeRating,HttpSession session) throws Exception {
		Member user = (Member)session.getAttribute("user");
		reviewpb.setMemNo(user.getMemNo());
		System.out.println(reviewpb.getContent());
		reviewpb.setPbNo(reviewpb.getPbNo());
		
		int pbNo = reviewpb.getPbNo();
		int rating = reviewpb.getRating();
		double avg = storeRating + (rating - storeRating) / ++ratingCnt; 
		
		StorePB spb = new StorePB();
		spb.setPbNo(pbNo);
		spb.setRatingCnt(ratingCnt);
		spb.setRating(avg);
		
		service.insertPBReview(reviewpb,spb);
		
		String uploadRoot = "c:/bit2019/upload";
		SimpleDateFormat sdf = new SimpleDateFormat(
				"/yyyy/MM/dd"
		);
		
		String path = "/pbReview" + sdf.format(new Date());
		File file = new File(uploadRoot + path);
		if (file.exists() == false) file.mkdirs();
		
		for (MultipartFile mFile : fileVO.getImageList()) {
			if (mFile.isEmpty()) {
				break;
			}
			String uName =  UUID.randomUUID().toString() + mFile.getOriginalFilename();
			mFile.transferTo(new File(uploadRoot + path + "/" + uName));
			
			System.out.println(reviewpb.getPbReviewNo());
			fileVO.setPbReviewNo(reviewpb.getPbReviewNo());
			fileVO.setPath(path);
			fileVO.setOrgname(mFile.getOriginalFilename());
			fileVO.setSysname(uName);
			service.insertPBReviewImage(fileVO);
		}
		
		
		return avg;
	}
	
	// pb 상품 후기 수정
	@RequestMapping("/pbreviewupdateform.do")
	@ResponseBody
	public StorePBReview pbreviewupdateform(int pbReviewNo) {
		return service.selectReviewByNo(pbReviewNo);
	}
	
	// pb 상품 후기 삭제
	@RequestMapping("/pbreviewdelete.do")
	@ResponseBody
	public void deleteReviewByNo(int pbReviewNo, StorePBReview reviewpb) {
		service.deleteReviewByNo(pbReviewNo);
	}
	
	///////////////////////////////////////////////////////////////////////////
	
	// pb 상품 문의 등록
	@RequestMapping("/pbinquiryinsert.do")
	@ResponseBody
	public void insertInquiry(StorePBInquire storePBInquire, HttpSession session) {
		Member user = (Member)session.getAttribute("user");
		storePBInquire.setMemNo(user.getMemNo());
		storePBInquire.setPbNo(storePBInquire.getPbNo());
		storePBInquire.setContent(storePBInquire.getContent());
		service.insertInquiry(storePBInquire);
	}
	
	// pb 상품 문의 수정폼
	@RequestMapping("/pbinquiryupdateform.do")
	@ResponseBody
	public StorePBInquire updateInquiryform(int inquiryNo) {
		return service.selectInquiryByNo(inquiryNo);
	}
	
	// pb 상품 문의 수정
	@RequestMapping("/pbinquiryupdate.do")
	@ResponseBody
	public void updateInquiry(StorePBInquire storePBInquire) {
		System.out.println(storePBInquire.getPbNo());
		System.out.println(storePBInquire.getInquiryNo());
		System.out.println(storePBInquire.getContent());
		service.updateInquiry(storePBInquire);
	}
	
	// pb 상품 문의 삭제
	@RequestMapping("/pbinquirydelete.do")
	@ResponseBody
	public void deleteInquiry(int inquiryNo) {
		service.deleteInquiry(inquiryNo);
	}
	
	
	// pb 상품 결제
	
	// pb 상품 결제 등록
	@RequestMapping("/pbpaymentinsert.do")
	@ResponseBody
	public int insertPBPayment(@RequestBody List<StorePBPayment> storePBPayment, HttpSession session) {
		System.out.println("컨트롤러 도착");
		for (StorePBPayment s : storePBPayment) {
			System.out.println("mem_no : " + s.getMemNo());
			System.out.println("price : " + s.getPrice());
			System.out.println("count : " + s.getProdCount());
			Member user = (Member)session.getAttribute("user");
			s.setMemNo(user.getMemNo());
			service.insertPBPayment(s);
		}
		System.out.println("컨트롤러 끝");
		return 1;
	}
	
	// pb 상품 장바구니
	
	// pb 상품 장바구니 등록
	@RequestMapping("/pbcartinsert.do")
	@ResponseBody
	public void insertPBCart(StorePBCart storePBCart, HttpSession session) {
		Member user = (Member)session.getAttribute("user");
		storePBCart.setMemNo(user.getMemNo());
		service.insertPBCart(storePBCart);
	}
	
	// pb 장바구니 조회
	@RequestMapping("/cartpb.do")
	public void cartpb (int memNo, Model model) {
		List<StorePBCart> cartList = service.selectPBCartByMember(memNo);
		List<StorePBCart> result = new ArrayList<>();
		for (StorePBCart storePBCart : cartList) {
			String imgpath = "";
			
			if (storePBCart.getImgPath() == null) {
				imgpath = "/babmukja/store/downloadpb.do?path=/&sysname=default.png";
				storePBCart.setImgPath(imgpath);
				result.add(storePBCart);
				continue;
			}
			String[] imgList = storePBCart.getImgPath().split(",");
			storePBCart.setImgPath(imgList[0]);
			result.add(storePBCart);
		}
		model.addAttribute("cartList", result);	
	}
	
	// pb 장바구니 삭제
	@RequestMapping("/deletepbcart.do")
	@ResponseBody
	public void deletePBCart(int cartNo) {
		service.deletePBCart(cartNo);
	}
	
	@RequestMapping("/pblike.do")
	@ResponseBody
	public Map<String, Object> like(StorePBLike pbLike, HttpSession session) {
		System.out.println("pbLike 컨트롤러 도착쓰");
		int count = service.selectCountLike(pbLike);
		String status = service.selectLikeStatus(pbLike);
		
		Map<String, Object> list = new HashMap<>();
		
		if (count == 1) {
			if (status.equals("Y")) {
				pbLike.setLikeStatus("N");
				service.updatePBLike(pbLike);
				service.deleteLikeCnt(pbLike.getPbNo());
				
				list.put("status", pbLike.getLikeStatus());
				list.put("cnt", service.countLikeCnt(pbLike.getPbNo()));
				return list;
				
			} else if (status.equals("N")){
				pbLike.setLikeStatus("Y");
				service.updatePBLike(pbLike);
				service.deleteLikeCnt(pbLike.getPbNo());
				
				list.put("status", pbLike.getLikeStatus());
				list.put("cnt", service.countLikeCnt(pbLike.getPbNo()));
				return list;
			}
		} else {
			service.insertPBLike(pbLike);
			service.updateLikeCnt(pbLike.getPbNo());
			
			list.put("status", pbLike.getLikeStatus());
			list.put("cnt", service.countLikeCnt(pbLike.getPbNo()));
			return list;
		}
		return list;
	}
}
