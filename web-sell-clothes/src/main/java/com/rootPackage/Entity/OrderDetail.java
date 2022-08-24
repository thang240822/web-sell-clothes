package com.rootPackage.Entity;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name="orderdetails" , uniqueConstraints = {
		@UniqueConstraint(columnNames = {"OrderID","ProductID"})
})
@Entity
public class OrderDetail implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column (name="id")
	private Integer id;
	@Column(name="Price")
	private Double price;
	@Column(name="Quantity")
	private Integer quantity;
	
	@ManyToOne(cascade = CascadeType.ALL )
	@JoinColumn(name="OrderId" ,referencedColumnName = "id")
	private Order order;
	
	@ManyToOne(cascade = CascadeType.ALL )
	@JoinColumn(name="ProductId", referencedColumnName = "id")
	private Product product;
}
