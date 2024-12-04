document.addEventListener("DOMContentLoaded", () => {
  let ingredientCount = 0;  // 食材の追加番号
  let stepCount = document.querySelectorAll('.step').length;  // 既存のステップ数からスタート

  // 材料の追加
  document.getElementById("add_ingredient").addEventListener("click", () => {
    ingredientCount++;  // 食材番号を増やす
    const ingredientDiv = document.createElement("div");
    ingredientDiv.classList.add("ingredient", "card", "mb-3", "p-3");
    ingredientDiv.innerHTML = `
      <div class="card-header">
        <h5>Ingredient ${ingredientCount}</h5>
      </div>
      <div class="card-body">
        <div class="form-group row">
          <label for="ingredient_name_${ingredientCount}" class="col-md-3 col-form-label">食材名</label>
          <div class="col-md-9">
            <input type="text" name="recipe[ingredients_attributes][${ingredientCount}][name]" id="ingredient_name_${ingredientCount}" placeholder="食材名を入力してください" class="form-control mt-2">
          </div>
        </div>
        <div class="form-group row">
          <label for="ingredient_quantity_${ingredientCount}" class="col-md-3 col-form-label">分量</label>
          <div class="col-md-9">
            <input type="text" name="recipe[ingredients_attributes][${ingredientCount}][quantity]" id="ingredient_quantity_${ingredientCount}" placeholder="分量を入力してください" class="form-control mt-2">
          </div>
        </div>
      </div>
    `;
    document.getElementById("ingredients_section").appendChild(ingredientDiv);
  });

  // 作り方の追加
  document.getElementById("add_step").addEventListener("click", () => {
    stepCount++;  // ステップ番号を増やす
    const stepDiv = document.createElement("div");
    stepDiv.classList.add("step", "card", "mb-3", "p-3");
    stepDiv.innerHTML = `
      <div class="card-header">
        <h5>Step ${stepCount}</h5>
      </div>
      <div class="card-body">
        <div class="form-group">
          <label for="step_description_${stepCount}">作り方</label>
          <textarea name="recipe[steps_attributes][${stepCount}][description]" id="step_description_${stepCount}" placeholder="作り方を入力してください" rows="3" class="form-control mt-2"></textarea>
        </div>
        <div class="form-group">
          <label for="step_image_${stepCount}">画像</label>
          <input type="file" name="recipe[steps_attributes][${stepCount}][image]" id="step_image_${stepCount}" class="form-control mt-2">
        </div>
      </div>
    `;
    document.getElementById("steps_section").appendChild(stepDiv);
  });
});
