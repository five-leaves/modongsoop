package net.fiveleaves.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AttachFileDTO {
	private String fileName;
	private String filePath;
	private String thumbnailPath;
	private boolean image;
}
