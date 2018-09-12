package me.imran.personalblog.website.model;


import lombok.Data;
import me.imran.personalblog.admin.model.Post;

import javax.persistence.*;
import java.io.Serializable;

/**
 * @author Imran Hossain
 */
@Entity
@Table(name="vw_search")
@Data
public class Search implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    private String id;
    private String title;
    private String description;
    private String link;
    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "postId")
    private Post post;
}
