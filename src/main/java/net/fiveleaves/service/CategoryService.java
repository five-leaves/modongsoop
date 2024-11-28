package net.fiveleaves.service;

import java.util.List;

import net.fiveleaves.domain.CategoryDTO;

public interface CategoryService {
	public List<CategoryDTO> getCategoryList() throws Exception;	// 카테고리 목록
}
