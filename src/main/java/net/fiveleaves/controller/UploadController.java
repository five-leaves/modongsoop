package net.fiveleaves.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;
import net.fiveleaves.domain.AttachFileDTO;

@Controller
@Log4j
//@PropertySource("classpath:application.properties")
public class UploadController {

//	@Value("${uploadFolder}")
	private String uploadFolder="C:/dev/upload";

	private String getFolder() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}
	
	private boolean checkImageType(File file) {

		try {
			String contentType = Files.probeContentType(file.toPath());

			return contentType.startsWith("image");

		} catch (IOException e) {
			e.printStackTrace();
		}

		return false;
	}

	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileDTO>> uploadAjaxPost(MultipartFile[] uploadFile) {

		List<AttachFileDTO> list = new ArrayList<>();

		String uploadFolderPath = getFolder();
		// make yyyy/MM/dd folder
		File uploadPath = new File(uploadFolder, uploadFolderPath);

		if (uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}

		for (MultipartFile multipartFile : uploadFile) {

			AttachFileDTO attachDTO = new AttachFileDTO();

			String uploadFileName = multipartFile.getOriginalFilename();

			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name: " + uploadFileName);
			attachDTO.setFileName(uploadFileName);

			UUID uuid = UUID.randomUUID();

			uploadFileName = uuid.toString() + "_" + uploadFileName;

			try {
				// 원본 저장
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);

				File filePath = new File(uploadFolderPath, uploadFileName);
				log.info("saveFile: " + filePath);
				attachDTO.setFilePath(filePath.getPath());

				// check image type file
				if (checkImageType(saveFile)) {

					attachDTO.setImage(true);
					log.info(attachDTO);
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "t_" + uploadFileName));
					log.info(attachDTO);
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100);
					log.info(attachDTO);
					File thumbFile = new File(uploadFolderPath, "t_" + uploadFileName);
					log.info(attachDTO);
					attachDTO.setThumbnailPath(thumbFile.getPath());

					thumbnail.close();
					log.info(attachDTO);
				}


			} catch (Exception e) {
				e.printStackTrace();
			}

			// add to List
			list.add(attachDTO);
		}
		return new ResponseEntity<>(list, HttpStatus.OK);
	}
	
	@GetMapping("/display")	
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {

		log.info("fileName: " + fileName);

		File file = new File(uploadFolder, fileName);
		log.info("file: " + file);

		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();

			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
}