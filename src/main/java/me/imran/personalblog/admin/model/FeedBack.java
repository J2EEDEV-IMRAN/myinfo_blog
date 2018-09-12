package me.imran.personalblog.admin.model;

/**
 * Created by ataur on 1/25/17.
 */

import com.fasterxml.jackson.annotation.JsonView;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;


@Entity
@Table(name="FeedBack")
@EqualsAndHashCode
@ToString
public class FeedBack implements Serializable{

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name = "id")
    @Getter
    @Setter
    @JsonView(DataTablesOutput.View.class)
    private Integer id;

    
	@Getter
	@Setter
	@Column(name="Name")
	@JsonView(DataTablesOutput.View.class)
	private String name;

	
	@Getter
	@Setter
	@Column(name="Email")
	@JsonView(DataTablesOutput.View.class)
	private String email;

    @Getter
    @Setter
    @Column(name="Subject")
    @JsonView(DataTablesOutput.View.class)
    private String subject;
	
	
	@Getter
	@Setter
	@Column(name="Message")
	@JsonView(DataTablesOutput.View.class)
	private String message;
	

    
    @Getter
    @Setter
    @Column(name="CreatedBy")
    @JsonView(DataTablesOutput.View.class)
    private String  createdBy;
            
    @Getter
    @Setter
    @Column(name="CreatedAt")
    @DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    @JsonView(DataTablesOutput.View.class)
    private Date createdAt;
            
    @Getter
    @Setter
    @Column(name="UpdatedBy")
    @JsonView(DataTablesOutput.View.class)
    private String  updatedBy;
            
    @Getter
    @Setter
    @Column(name="UpdatedAt")
    @DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
    @JsonView(DataTablesOutput.View.class)
    private Date updatedAt;

    public FeedBack() {
        super();
    }


}