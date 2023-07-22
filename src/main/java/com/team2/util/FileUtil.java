package com.team2.util;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class FileUtil {
	
	// File Separator
	private String fs = System.getProperty("file.separator");

	public List<String> multiFileProcess(MultipartHttpServletRequest request, String b_no) throws Exception {

		List<String> fileList = new ArrayList<String>();
		Iterator<String> fileNames = request.getFileNames();
		while (fileNames.hasNext()) {
			String fileName = fileNames.next();
			MultipartFile mFile = request.getFile(fileName);
			String originalFileName = mFile.getOriginalFilename();
			fileList.add(originalFileName);
			File file = new File(getFileRepository(b_no) + fs + fileName);
			if (mFile.getSize() != 0) {
				if (!file.exists()) {
					if (file.getParentFile().mkdirs()) {
						file.createNewFile();
					}
				}
				mFile.transferTo(new File(getFileRepository(b_no) + fs + originalFileName));
			}
		}
		return fileList;
	}

	private File getFileRepository(String b_no) {
		String os = System.getProperty("os.name").toLowerCase();
		String baseDir = System.getProperty("user.home");
		File repository = null;
		if (os.contains("win")) {
			// Windows
			// CurrentDirPath = new File(baseDir + fs + "SHELLWI_Image_Files" + fs); //
			// C:\Users\mirinae\SHELLWI_Image_Files
			repository = new File("C:" + fs + "SHELLWI_Image_Files" + fs + b_no); // C:\SHELLWI_Image_Files
		} else if (os.contains("nix") || os.contains("nux") || os.contains("aix")) {
			// Linux
			repository = new File(baseDir + fs + "shellwi_image_files" + fs + b_no); // /home/mirinae/shellwi_image_files
		} else if (os.contains("mac")) {
			// MacOS
			repository = new File(baseDir + fs + "shellwi_image_files" + fs + b_no); // /Users/mirinae/shellwi_image_files
		} else {
			repository = null;
		}
		log.info("IMAGE_DIR: {}", repository);
		return repository;
	}

}
