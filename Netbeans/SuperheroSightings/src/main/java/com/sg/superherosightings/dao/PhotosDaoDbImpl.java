/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sg.superherosightings.dao;

import com.sg.superherosightings.dto.Photo;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author laptop
 */
public class PhotosDaoDbImpl implements PhotosDao {
    
    private JdbcTemplate jdbcTemplate;
    
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }
    
    private static final String SQL_INSERT_IMAGE
            = "insert into `Images` (Name, ImageType, Image) " + " values (?, ?, ?)";

    private static final String SQL_SELECT_IMAGE
            = "select * from `Images` where ImageID = ?";

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)

    public Photo addImage(Photo image) {
        jdbcTemplate.update(SQL_INSERT_IMAGE,
                image.getName(),
                image.getType());

        int newId = jdbcTemplate.queryForObject("select LAST_INSERT_ID", Integer.class);

        image.setImageID(newId);

        return image;

    }

    @Override
    public Photo getImageByID(int imageID) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_IMAGE,
                    new SuperheroSightingsDbDao.ImageMapper(), imageID);
        } catch (Exception ex) {
//            EmptyResultDataAccessException
            System.out.println("I had an exception");

            return null;
        }
    }

    private static final class ImageMapper implements RowMapper<Photo> {

        public Photo mapRow(ResultSet rs, int rowNum) throws SQLException {
            Photo img = new Photo();
            img.setImageID(rs.getInt("ImageID"));
            img.setName(rs.getString("Name"));
            img.setType(rs.getString("ImageType"));

            Blob myImage = rs.getBlob(4);
            int length = (int) myImage.length();

            return img;

        }
    }

}
