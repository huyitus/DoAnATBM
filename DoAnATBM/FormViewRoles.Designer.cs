namespace DoAnATBM
{
    partial class FormViewRoles
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.RolesGridView = new System.Windows.Forms.DataGridView();
            ((System.ComponentModel.ISupportInitialize)(this.RolesGridView)).BeginInit();
            this.SuspendLayout();
            // 
            // RolesGridView
            // 
            this.RolesGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.RolesGridView.Location = new System.Drawing.Point(12, 12);
            this.RolesGridView.Name = "RolesGridView";
            this.RolesGridView.RowHeadersWidth = 51;
            this.RolesGridView.RowTemplate.Height = 24;
            this.RolesGridView.Size = new System.Drawing.Size(818, 451);
            this.RolesGridView.TabIndex = 0;
            this.RolesGridView.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.RolesGridView_CellContentClick);
            // 
            // FormViewRoles
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(842, 475);
            this.Controls.Add(this.RolesGridView);
            this.Name = "FormViewRoles";
            this.Text = "Danh sách Roles";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.FormViewRoles_FormClosing);
            ((System.ComponentModel.ISupportInitialize)(this.RolesGridView)).EndInit();
            this.ResumeLayout(false);
        }

        #endregion
        private System.Windows.Forms.DataGridView RolesGridView;

    }
}