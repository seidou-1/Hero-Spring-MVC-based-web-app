/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.service;

import com.sg.superherosightings.dto.Photo;

/**
 *
 * @author laptop
 */
public interface PhotosService {
    public Photo addImage(Photo image);

    public Photo getImageByID(int imageID);
}
