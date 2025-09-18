using System;
using System.Collections.Generic;

// 分页信息
namespace app.Dbs.Collects
{
    public class Page
    {
        public long totalCount; // 总条数
        public int currentPage; // 当前页
        public int pageSize;    // 一页显示多少条
        public int pageCount; // 总页数
        public bool isPrev; // 是否有上一页
        public bool isNext; // 是否有下一页
        public List<int> pageNumber;
        
        public int prevPage; // 上一页页码
        public int nextPage;
    }
}