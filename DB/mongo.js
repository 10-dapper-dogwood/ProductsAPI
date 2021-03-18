import mongoose from 'mongoose';
const { Schema } = mongoose;

const stylesSchema = new Schema({
  style_id: Number,
  sale_price: Number,
  default: String,
  photos: [{ thumbnail_url: String, url: String }],
});

const skusSchema = new Schema({
  skus_id: Number,
  quantity: Number,
  size: String,
});

const productSchema = new Schema({
  id: Number,
  name: String,
  slogan: String,
  description: String,
  category: String,
  default_price: Number,
  related: [Number],
  skus: [skusSchema],
  styles: [stylesSchema]
});
