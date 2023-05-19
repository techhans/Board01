package com.springmvc.my.dao;

import java.util.*;

import com.springmvc.my.domain.*;

public interface BoardDao {
    BoardDto select(Integer bno) throws Exception;
    int delete(Integer bno, String writer) throws Exception;
    int insert(BoardDto dto) throws Exception;
    int update(BoardDto dto) throws Exception;
    int increaseViewCnt(Integer bno) throws Exception;

    List<BoardDto> selectPage(Map map) throws Exception;
    List<BoardDto> selectAll() throws Exception;
    int deleteAll() throws Exception;
    int count() throws Exception;

    int searchResultCnt(SearchCondition sc) throws Exception;
    List<BoardDto> searchSelectPage(SearchCondition sc) throws Exception;
    
    public int updateCommentCnt(Integer bno, Integer cnt) throws Exception;
}
