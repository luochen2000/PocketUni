package com.nowcoder.controller;

import com.nowcoder.async.EventModel;
import com.nowcoder.async.EventProducer;
import com.nowcoder.async.EventType;
import com.nowcoder.model.EntityType;
import com.nowcoder.model.HostHolder;
import com.nowcoder.model.News;
import com.nowcoder.service.LikeService;
import com.nowcoder.service.NewsService;
import com.nowcoder.util.ToutiaoUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by nowcoder on 2016/7/13.
 */
@Controller
public class LikeController {
    @Autowired
    LikeService likeService;

    @Autowired
    HostHolder hostHolder;

    @Autowired
    NewsService newsService;

    @Autowired
    EventProducer eventProducer;


    /**
     * 喜欢控制器
     * @param newsId
     * @return
     */
    @RequestMapping(path = {"/like"}, method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String like(@Param("newId") int newsId) {
//        long likeCount = likeService.like(hostHolder.getUser().getId(), EntityType.ENTITY_NEWS, newsId);
// 更新喜欢数
        News news = newsService.getById(newsId);
        newsService.updateLikeCount(newsId, news.getLikeCount() + 1);
        if (hostHolder.getUser().getId() != news.getUserId()) {
            eventProducer.fireEvent(new EventModel(EventType.LIKE)
                    .setActorId(hostHolder.getUser().getId()).setEntityId(newsId)
                    .setEntityType(EntityType.ENTITY_NEWS).setEntityOwnerId(news.getUserId()));
        }
        return ToutiaoUtil.getJSONString(0, String.valueOf(news.getLikeCount() + 1));
    }

    @RequestMapping(path = {"/dislike"}, method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String dislike(@Param("newId") int newsId) {
//        long disLikeCount = likeService.disLike(hostHolder.getUser().getId(), EntityType.ENTITY_NEWS, newsId);
        News news = newsService.getById(newsId);
        System.out.println(news.getLikeCount());
// 更新不喜欢数
// 如果喜欢数为0的话不做操作直接返回
        if (news.getLikeCount() == 0) {
            return ToutiaoUtil.getJSONString(0, String.valueOf(news.getLikeCount()));
        }
        newsService.updateLikeCount(newsId, news.getLikeCount() - 1);
        return ToutiaoUtil.getJSONString(0, String.valueOf(news.getLikeCount() - 1));
    }
}
