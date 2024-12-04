document.addEventListener("DOMContentLoaded", () => {
  // 材料の追加
  document.getElementById("add_ingredient").addEventListener("click", () => {
    const ingredientDiv = document.createElement("div");
    ingredientDiv.classList.add("ingredient");
    ingredientDiv.innerHTML = `
      <input type="text" name="recipe[ingredients_attributes][][name]" placeholder="食材名を入力してください" class="form-control mt-2">
      <input type="text" name="recipe[ingredients_attributes][][quantity]" placeholder="分量を入力してください" class="form-control mt-2">
    `;
    document.getElementById("ingredients_section").appendChild(ingredientDiv);
  });

  // 作り方の追加
  document.getElementById("add_step").addEventListener("click", () => {
    const stepDiv = document.createElement("div");
    stepDiv.classList.add("step");
    stepDiv.innerHTML = `
      <textarea name="recipe[steps_attributes][][description]" placeholder="作り方を入力してください" rows="3" class="form-control mt-2"></textarea>
      <input type="file" name="recipe[steps_attributes][][image]" class="form-control mt-2">
    `;
    document.getElementById("steps_section").appendChild(stepDiv);
  });
});
