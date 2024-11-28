package net.fiveleaves.mapper;

import java.util.List;

import net.fiveleaves.domain.CategoryDTO;

public interface CategoryMapper {
	public List<CategoryDTO> getCategoryList();				// 카테고리 목록
}
