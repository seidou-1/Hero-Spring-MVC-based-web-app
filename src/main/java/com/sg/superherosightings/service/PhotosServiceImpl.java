/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.service;

import com.sg.superherosightings.dao.PhotosDao;
import com.sg.superherosightings.dto.Photo;

/**
 *
 * @author laptop
 */
public class PhotosServiceImpl implements PhotosDao {
    
    PhotosDao photosDao;

    public PhotosServiceImpl(PhotosDao photosDao) {
        this.photosDao = photosDao;
    }
    
    

    @Override
    public Photo addImage(Photo image) {
        return photosDao.addImage(image);
    }

    @Override
    public Photo getImageByID(int imageID) {
        return photosDao.getImageByID(imageID);
    }
    
}
