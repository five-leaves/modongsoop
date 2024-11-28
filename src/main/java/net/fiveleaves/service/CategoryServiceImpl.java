package net.fiveleaves.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.log4j.Log4j;
import net.fiveleaves.domain.CategoryDTO;
import net.fiveleaves.mapper.CategoryMapper;

@Service
@Log4j
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryMapper mapper;

	@Override
	public List<CategoryDTO> getCategoryList() throws Exception {
		return mapper.getCategoryList();
	}
	
}
