package me.imran.personalblog.admin.model;
/**
 * @author Imran Hossain
 */
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import com.fasterxml.jackson.annotation.*;

import org.springframework.data.jpa.datatables.mapping.DataTablesOutput;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;

import javax.persistence.*;
import java.util.*;


@Entity
@Table(name="Hit")
@EqualsAndHashCode
@ToString
public class Hit implements Serializable{

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
	@Column(name="ip")
	@JsonView(DataTablesOutput.View.class)
	private String ip;
	
	
	@Getter
	@Setter
	@Column(name="browser")
	@JsonView(DataTablesOutput.View.class)
	private String browser;
	
	
	@Getter
	@Setter
	@Column(name="browserVersion")
	@JsonView(DataTablesOutput.View.class)
	private String browserVersion;
	
	
	@Getter
	@Setter
	@Column(name="OperatingSystem")
	@JsonView(DataTablesOutput.View.class)
	private String operatingSystem;
	
	
	@Getter
	@Setter
	@Column(name="date")
	@DateTimeFormat(pattern = "dd/MM/yyyy HH:mm:ss")
	@JsonView(DataTablesOutput.View.class)
	private Date date;
	
	
	@Getter
	@Setter
	@Column(name="resource")
	@JsonView(DataTablesOutput.View.class)
	private String resource;
	
	
	@Getter
	@Setter
	@Column(name="query")
	@JsonView(DataTablesOutput.View.class)
	private String query;
	
	
	@Getter
	@Setter
	@Column(name="type")
	@JsonView(DataTablesOutput.View.class)
	private String type;
	
	

    
    
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

    public Hit() {
        super();
    }


}